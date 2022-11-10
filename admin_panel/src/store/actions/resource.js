import axios from '../../shared/axios';

import * as actionTypes from './actionTypes';

export const addResource = (gtin, name, resourceLanguage, link_type, resourceUrl) => {
    return dispatch => {
        dispatch(addResourceStart());
        if (name === ""){
            dispatch(addResourceFail("Debe ingresar el nombre del recurso"));
        } else if (resourceUrl === ""){
            dispatch(addResourceFail("Debe ingresar la URL del recurso"))
        } else if (resourceLanguage === "" && link_type === ""){
            dispatch(addResourceFail("Debe ingresar el lenguaje y/o el tipo de link del recurso"))
        } else {
            const queryParams = '?gtin=' + gtin;
            const url = '/product/addResource' + queryParams;
            axios({url: url, method: 'POST', data:{name: name, link_type: link_type, language: resourceLanguage, resource_url: resourceUrl}, headers: {'Access-Control-Allow-Origin': '*'}}).then((response) => {
            dispatch(addResourceSuccess("El recurso fue agregado satisfactoriamente :)"));            
            }).catch(error => {
                if (error.response.status === 404){
                    dispatch(addResourceFail("El producto solicitado no existe."));
                }else{
                    dispatch(addResourceFail("Ocurrió un error al realizar la consulta."));
                }
            })
        }
        
    }
} 

export const addResourceStart = () => {
    return {
        type: actionTypes.ADDRESOURCE_START
    };
};

export const addResourceSuccess = ( mensajeSatisfactorio ) => {
    return {
        type: actionTypes.ADDRESOURCE_SUCCESS,
        mensajeSatisfactorio: mensajeSatisfactorio
    };
};

export const addResourceFail = ( mensajeError ) => {
    return {
        type: actionTypes.ADDRESOURCE_FAIL,
        mensajeError: mensajeError
    };
};