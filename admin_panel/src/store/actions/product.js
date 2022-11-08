import axios from '../../shared/axios';

import * as actionTypes from './actionTypes';

export const getProduct = (gtin) => {
    console.log(gtin);
    return dispatch => {
        dispatch(getProductStart());
        const queryParams = '?gtin=' + gtin;
        const url = '/admin/product' + queryParams;
        console.log(url);
        console.log(process.env.REACT_APP_URL_SERVICES);
        axios({url: url, method: 'GET', responseType: 'arraybuffer', headers: {'Access-Control-Allow-Origin': '*'}}).then((response) => {
            console.log(response);
        })
    }
} 

export const getProductStart = () => {
    return {
        type: actionTypes.GETPRODUCT_START
    };
};

export const getProductSuccess = ( gtin ) => {
    return {
        type: actionTypes.GETPRODUCT_SUCCESS,
        gtin: gtin
    };
};

export const getProductFail = ( mensajeError ) => {
    return {
        type: actionTypes.GETPRODUCT_FAIL,
        mensajeError: mensajeError
    };
};