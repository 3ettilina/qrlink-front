import * as actionTypes from '../actions/actionTypes';
import { updateObject } from '../../shared/utility';

const initialState = {
    loading: false,
    muestroError: false,
    mensajeError: null,
    muestroSatisfactorio: false,
    mensajeSatisfactorio: null
};

const addResourceStart = ( state, action ) => {
    const updatedState = {
        muestroError: false,
        mensajeError: [],
        loading: true
    }

    return updateObject( state, updatedState );
};

const addResourceSuccess = ( state, action ) => {
    return updateObject( state, {
        loading: false, muestroSatisfactorio: true, mensajeSatisfactorio: action.mensajeSatisfactorio } );
};

const addResourceFail = ( state, action ) => {
    return updateObject( state, { loading: false, muestroError: true, mensajeError: action.mensajeError } );
};

const reducer = ( state = initialState, action ) => {
    switch ( action.type ) {
        case actionTypes.ADDRESOURCE_START: return addResourceStart( state, action );
        case actionTypes.ADDRESOURCE_SUCCESS: return addResourceSuccess( state, action );
        case actionTypes.ADDRESOURCE_FAIL: return addResourceFail( state, action );
        default: return state;
    }
};

export default reducer;