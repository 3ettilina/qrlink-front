import React, { Component } from 'react';
import './Resource.css';
import { connect } from 'react-redux';

import Input from '../../components/UI/Input/Input';
import Button from '../../components/UI/Button/Button';
import { updateObject} from '../../shared/utility';

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
                label: 'Tipo de link *'
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
            },
            showBody: false,
            showBodyAfterExport: false,
            showBodyError: false,
            ErrorMessage: ''
        }

    }

    filtersChangedHandler = (input, inputIdentifier) => {
        //OBTENGO EL VALOR INGRESADO
        var inputValor = input.target.value;
        
        const updatedFilterElement = updateObject(this.state.filters[inputIdentifier], {value: inputValor });
        const updatedFilters = updateObject(this.state.filters, { [inputIdentifier] : updatedFilterElement });
        this.setState({filters: updatedFilters});
        console.log(this.state.filters[inputIdentifier]);
    }

    addResource(){
        if (this.state.filters.nombreRecurso === ("" || null)){
            
        }else if (this.state.filters.tipoLink === ("" || null)){
                
        }else if (this.state.filters.url === ("" || null)){
                
        }else{
            let nombreRecurso = this.state.filters.nombreRecurso;
            let tipoLink = this.state.filters.tipoLink;
            let url = this.state.filters.url;
            let idiomaRecurso = this.state.filters.idiomaRecurso;
            this.props['onAddResource'](nombreRecurso,tipoLink,idiomaRecurso,url);
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
            </div>
        );

        return (
        <div className="Resource">
            <h2>Agregar recurso</h2>
            <div className="Resource-fields">
                {filters}
                <div className='Button'>
                <Button btnType="Success" keyDown={(e) => e.preventDefault()} clicked= {() => this.getReport()}>AGREGAR RECURSO</Button>   
                </div>            
            </div>
        </div>
        );
    }
}
  
export default Resource;