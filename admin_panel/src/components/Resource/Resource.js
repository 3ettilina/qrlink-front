import React, { Component } from 'react';
import './Resource.css';
import { connect } from 'react-redux';
import * as actions from '../../store/actions/index';

import Input from '../../components/UI/Input/Input';
import Button from '../../components/UI/Button/Button';
import Spinner from '../../components/UI/Spinner/Spinner';
import { updateObject} from '../../shared/utility';

import Alert from '@material-ui/lab/Alert';

class Resource extends Component {

    state={
        filters: {
            nombreRecurso: {
                elementType: 'input',
                elementConfig: {
                    type: 'text',
                    placeholder: ''
                },  
                value: '',
                label: 'Nombre de recurso *'
            },
            tipoLink: {
                elementType: 'input',
                elementConfig: {
                    type: 'text',
                    placeholder: ''
                },  
                value: '',
                label: 'Tipo de link'
            },
            idiomaRecurso: {
                elementType: 'input',
                elementConfig: {
                    type: 'text',
                    placeholder: ''
                },  
                value: '',
                label: 'Idioma de recurso'
            },
            url: {
                elementType: 'input',
                elementConfig: {
                    type: 'text',
                    placeholder: ''
                },  
                value: '',
                label: 'URL *'
            }
        },
        showBody: false,
        showBodyAfterExport: false
    }

    /*componentDidMount = () => {
        const mapStateToProps = state => {
            return {
                mensajeError: [],
                muestroError: false,
                mensajeSatisfactorio: [],
                muestroSatisfactorio: false,
            };
        };
    }*/

    filtersChangedHandler = (input, inputIdentifier) => {
        //OBTENGO EL VALOR INGRESADO
        var inputValor = input.target.value;
        
        const updatedFilterElement = updateObject(this.state.filters[inputIdentifier], {value: inputValor });
        const updatedFilters = updateObject(this.state.filters, { [inputIdentifier] : updatedFilterElement });
        this.setState({filters: updatedFilters});
    }

    addResource(){
        if(!this.props.loading){
            let gtin = this.props.children;
            let nombreRecurso = this.state.filters.nombreRecurso.value;
            let tipoLink = this.state.filters.tipoLink.value;
            let url = this.state.filters.url.value;
            let idiomaRecurso = this.state.filters.idiomaRecurso.value;
            this.props['onAddResource'](gtin,nombreRecurso,tipoLink,idiomaRecurso,url);
            this.setState({showBody: true, showBodyAfterExport: false });
        }        
    }    
    
    render() {
        const filtersArray = [];
        for (let key in this.state.filters) {
            filtersArray.push({
                id: key,
                config: this.state.filters[key]
            });
        }

        let filters = (
            <div>                
                <h2>Agregar recurso</h2>
                {filtersArray.map(filterElement => (
                    <div key = {filterElement.id} tabIndex="0" className='Filters'>
                        <label key={filterElement.id}>{filterElement.config.label}</label>
                        <Input
                            elementType={filterElement.config.elementType}
                            elementConfig={filterElement.config.elementConfig}
                            value={filterElement.config.value}
                            changed={(event) => this.filtersChangedHandler(event, filterElement.id)} 
                            keyDown={(e) => e.preventDefault()}/>
                    </div>
                ))}
                <div className='Button'>
                    <Button btnType="Success" disabled={this.props.loading} clicked= {() => this.addResource()}>CONFIRMAR</Button>   
                </div> 
            </div>
        );

        let body = null;
        let bodyAfterExport = null;

        body = filters;

        if(this.props.loading){
            body = <Spinner />
            bodyAfterExport = body;
        } else if (this.props.muestroError){
            body =  
            <div>
                <Alert severity="error">
                    {this.props.mensajeError.map((msg, i) => { return <div key={i}>{msg}</div> })}
                </Alert> 
                {filters}                      
            </div>
            bodyAfterExport = body;
        } else if (this.props.muestroSatisfactorio){
            body =
            <div>
                <Alert severity="success">
                    {this.props.mensajeSatisfactorio.map((msg, i) => { return <div key={i}>{msg}</div> })}
                </Alert>                   
            </div>
        }

        return (
        <div className="Resource">
            <div className="Resource-fields">
                {body}           
            </div>
        </div>
        );
    }
}

const mapStateToProps = state => {
    return {
        loading: state.resource.loading,
        mensajeError: [state.resource.mensajeError],
        muestroError: state.resource.muestroError,
        mensajeSatisfactorio: [state.resource.mensajeSatisfactorio],
        muestroSatisfactorio: state.resource.muestroSatisfactorio,
    };
};

const mapDispatchToProps = dispatch => {
    return {
        onAddResource: (gtin,nombreRecurso,idiomaRecurso,tipoLink,url) => dispatch( actions.addResource(gtin,nombreRecurso,idiomaRecurso,tipoLink,url) )
    };
};

export default connect(mapStateToProps, mapDispatchToProps)(Resource);
