import React, { Component } from 'react';
import './Product.css';
import { connect } from 'react-redux';
import * as actions from '../../store/actions/index';

import Input from '../../components/UI/Input/Input';
import Button from '../../components/UI/Button/Button';
import { updateObject} from '../../shared/utility';

class Product extends Component {

    state={
        filters:{
            gtin: {
                elementType: 'input',
                elementConfig: {
                    type: 'text',
                    placeholder: ''
                },  
                value: '',
                label: 'GTIN *'
            }
        }

    }

    filtersChangedHandler = (input, inputIdentifier) => {
        //OBTENGO EL VALOR INGRESADO
        var inputValor = input.target.value;
        
        const updatedFilterElement = updateObject(this.state.filters[inputIdentifier], {value: inputValor });
        const updatedFilters = updateObject(this.state.filters, { [inputIdentifier] : updatedFilterElement });
        this.setState({filters: updatedFilters});
    }

    getProduct = () => {
        if(!this.props.loading){
            let gtin = this.state.filters.gtin.value;
            this.props['onGetProduct'](gtin);
            //this.setState({showBody: true, showBodyAfterExport: false });
        }
    }

    render(){
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
            <div className='Product'>
                <h2>Introduzca el GTIN</h2>
                {filters}
                <div className='Button'>
                    <Button btnType="Success" keyDown={(e) => e.preventDefault()} clicked= {() => this.getProduct()}>Buscar</Button>   
                </div> 
            </div>
        );
    }
};

const mapStateToProps = state => {
    return {
        gtin: state.product.gtin,
        loading: state.product.loading,
        mensajeError: [state.product.mensajeError],
        muestroError: state.product.muestroError
    };
};

const mapDispatchToProps = dispatch => {
    return {
        onGetProduct: (gtin) => dispatch( actions.getProduct(gtin) )
    };
};

export default connect(mapStateToProps, mapDispatchToProps)(Product);