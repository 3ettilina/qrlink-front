import React, { Component, forwardRef } from 'react';
import './Product.css';
import { connect } from 'react-redux';
import * as actions from '../../store/actions/index';

import Input from '../../components/UI/Input/Input';
import Button from '../../components/UI/Button/Button';
import Spinner from '../../components/UI/Spinner/Spinner';
import Modal from '../../components/UI/Modal/Modal.js';
import Resource from '../Resource/Resource';
import { updateObject} from '../../shared/utility';

import Alert from '@material-ui/lab/Alert';
import MaterialTable from 'material-table'
import AddBox from '@material-ui/icons/AddBox';
import ArrowDownward from '@material-ui/icons/ArrowDownward';
import Check from '@material-ui/icons/Check';
import ChevronLeft from '@material-ui/icons/ChevronLeft';
import ChevronRight from '@material-ui/icons/ChevronRight';
import Clear from '@material-ui/icons/Clear';
import DeleteOutline from '@material-ui/icons/DeleteOutline';
import Edit from '@material-ui/icons/Edit';
import FilterList from '@material-ui/icons/FilterList';
import FirstPage from '@material-ui/icons/FirstPage';
import LastPage from '@material-ui/icons/LastPage';
import Remove from '@material-ui/icons/Remove';
import SaveAlt from '@material-ui/icons/SaveAlt';
import Search from '@material-ui/icons/Search';
import ViewColumn from '@material-ui/icons/ViewColumn';

const tableIcons = {
    Add: forwardRef((props, ref) => <AddBox {...props} ref={ref} />),
    Check: forwardRef((props, ref) => <Check {...props} ref={ref} />),
    Clear: forwardRef((props, ref) => <Clear {...props} ref={ref} />),
    Delete: forwardRef((props, ref) => <DeleteOutline {...props} ref={ref} />),
    DetailPanel: forwardRef((props, ref) => <ChevronRight {...props} ref={ref} />),
    Edit: forwardRef((props, ref) => <Edit {...props} ref={ref} />),
    Export: forwardRef((props, ref) => <SaveAlt {...props} ref={ref} />),
    Filter: forwardRef((props, ref) => <FilterList {...props} ref={ref} />),
    FirstPage: forwardRef((props, ref) => <FirstPage {...props} ref={ref} />),
    LastPage: forwardRef((props, ref) => <LastPage {...props} ref={ref} />),
    NextPage: forwardRef((props, ref) => <ChevronRight {...props} ref={ref} />),
    PreviousPage: forwardRef((props, ref) => <ChevronLeft {...props} ref={ref} />),
    ResetSearch: forwardRef((props, ref) => <Clear {...props} ref={ref} />),
    Search: forwardRef((props, ref) => <Search {...props} ref={ref} />),
    SortArrow: forwardRef((props, ref) => <ArrowDownward {...props} ref={ref} />),
    ThirdStateCheck: forwardRef((props, ref) => <Remove {...props} ref={ref} />),
    ViewColumn: forwardRef((props, ref) => <ViewColumn {...props} ref={ref} />)
};

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
        },
        showBody: false,
        showBodyAfterExport: '',
        showModal: false

    }

    filtersChangedHandler = (input, inputIdentifier) => {
        //OBTENGO EL VALOR INGRESADO
        var inputValor = input.target.value;
        
        const updatedFilterElement = updateObject(this.state.filters[inputIdentifier], {value: inputValor });
        const updatedFilters = updateObject(this.state.filters, { [inputIdentifier] : updatedFilterElement });
        this.setState({filters: updatedFilters});
    }

    modalHandler = () => {
        this.setState( { showModal: true } );
    }

    modalCancelHandler = () => {
        this.setState( { showModal: false } );
    }

    getProduct = () => {
        if(!this.props.loading){
            let gtin = this.state.filters.gtin.value;
            this.props['onGetProduct'](gtin);
            this.setState({showBody: true, showBodyAfterExport: false });
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

        let body = null;
        let bodyAfterExport = null;

        if(this.props.loading){
            body = <Spinner />
            bodyAfterExport = body;
        } else if (this.props.muestroError){
                body =  
                <div>
                    <Alert severity="error">
                        {this.props.mensajeError.map((msg, i) => { return <div key={i}>{msg}</div> })}
                    </Alert>       
                </div>
                bodyAfterExport = body;
        }else if (this.state.showBody){
            if(this.props.name === ''){
                body = <Spinner />
                bodyAfterExport = body;
            }else{
                body=
                <div>
                    <p><b>Nombre:</b> {this.props.name}</p>
                    <p><b>URL:</b> <a href={this.props.url}>{this.props.url}</a></p>
                    <p><b>GTIN:</b> {this.props.gtin}</p> 
                    <div className='Tabla'>
                        <MaterialTable
                                    title="Recursos asignados al producto"
                                    columns={[
                                        {title: "Nombre", field: "name"},
                                        {title: "Tipo de link", field: "link_type", width: "1"},
                                        {title: "Lenguaje", field: "language", width: "1"},
                                        {title: "URL del Recurso", field: "resource_url", render: (rowData: any) => (
                                            <a
                                              href={rowData.resource_url}
                                              target="_blank"
                                              style={{ textDecoration: 'none' }}
                                            >
                                              {rowData.resource_url}
                                            </a>)},
                                    ]}
                                    data={this.props.resources}
                                    icons={tableIcons}
                                    localization={{
                                        body: { emptyDataSourceMessage: 'No hay registros para mostrar'},
                                        header: { actions: 'Acciones'},
                                        toolbar: {searchPlaceholder: "Buscar"},
                                        pagination: { firstTooltip: "Primera Página", previousTooltip: "Anterior", nextTooltip: "Siguiente", lastTooltip: "Última Página", labelDisplayedRows: "{from}-{to} de {count}", labelRowsSelect: "filas" }
                                    }}
                                    options={{
                                        sorting: true,
                                        pageSizeOptions: [50, 100, 250],
                                        maxBodyHeight: "60vh",
                                        pageSize:50,
                                        emptyRowsWhenPaging: false,
                                        tableLayout: 'fixed'
                                    }}
                                />       
                    </div>
                    <div className='Button'>
                        <Button btnType="Success" disabled={this.props.loading} clicked= {() => this.modalHandler()}>Agregar recurso</Button>   
                    </div>        
                </div>
            }
            
        }


        return (
            <div className='Product'>
                <div className='Product-filters'>
                    <h2>Introduzca el GTIN</h2>
                    {filters}
                    <div className='Button'>
                        <Button btnType="Success" disabled={this.props.loading} clicked= {() => this.getProduct()}>Buscar</Button>   
                    </div> 
                </div>
                <div className='Product-results'>
                    {this.state.showBody ? (this.state.showBodyAfterExport ? bodyAfterExport : body): null}
                </div>
                <Modal show={this.state.showModal} modalClosed={this.modalCancelHandler}>
                    <Resource>
                        {this.state.filters.gtin.value}
                    </Resource>
                </Modal>
            </div>
        );
    }
};

const mapStateToProps = state => {
    return {
        gtin: state.product.gtin,
        name: state.product.name,
        language: state.product.language,
        url: state.product.url,
        resources: state.product.resources,
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