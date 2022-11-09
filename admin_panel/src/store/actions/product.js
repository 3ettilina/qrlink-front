import axios from '../../shared/axios';

import * as actionTypes from './actionTypes';

export const getProduct = (gtin) => {
    return dispatch => {
        dispatch(getProductStart());
        const queryParams = '?gtin=' + gtin;
        const url = '/admin/product' + queryParams;
        axios({url: url, method: 'GET', responseType: 'json', headers: {'Access-Control-Allow-Origin': '*'}}).then((response) => {
          dispatch(getProductSuccess(response.data));            
        }).catch(error => {
                if (error.response.status === 404){
                    dispatch(getProductFail("El producto solicitado no existe."));
                }else{
                    dispatch(getProductFail("Ocurrió un error al realizar la consulta."));
                }
        })
    }
} 

export const getProductStart = () => {
    return {
        type: actionTypes.GETPRODUCT_START
    };
};

export const getProductSuccess = ( product ) => {
    return {
        type: actionTypes.GETPRODUCT_SUCCESS,
        gtin: product.gtin,
        name: product.name,
        languega: product.language,
        url: product.resource_url,
        resources: product.resources
    };
};

export const getProductFail = ( mensajeError ) => {
    return {
        type: actionTypes.GETPRODUCT_FAIL,
        mensajeError: mensajeError
    };
};