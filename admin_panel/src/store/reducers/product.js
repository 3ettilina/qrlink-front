import * as actionTypes from '../actions/actionTypes';
import { updateObject } from '../../shared/utility';

const initialState = {
    gtin: '',
    loading: false,
    muestroError: false,
    mensajeError: null
};

const getProductStart = ( state, action ) => {
    const updatedState = {
        muestroError: false,
        mensajeError: [],
        loading: true
    }

    return updateObject( state, updatedState );
};

const getProductSuccess = ( state, action ) => {
    return updateObject( state, {
        gtin: action.gtin,
        loading: false
    } );
};

const getProductFail = ( state, action ) => {
    return updateObject( state, { loading: false, muestroError: true, mensajeError: action.mensajeError } );
};

const reducer = ( state = initialState, action ) => {
    switch ( action.type ) {
        case actionTypes.GETPRODUCT_START: return getProductStart( state, action );
        case actionTypes.GETPRODUCT_SUCCESS: return getProductSuccess( state, action );
        case actionTypes.GETPRODUCT_FAIL: return getProductFail( state, action );
        default: return state;
    }
};

export default reducer;