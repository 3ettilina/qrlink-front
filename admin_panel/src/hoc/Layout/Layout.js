import React, { Component } from 'react';
import './Layout.css';
import Toolbar from '../../components/Navigation/Toolbar/Toolbar.js';
import Resource from '../../components/Resource/Resource';
import Product from '../../components/Product/Product';

class Layout extends Component {
    render(){
        return(
            <div>
                <Toolbar />
                <div className='Componentes'>
                    <Product />
                </div>
            </div>
        );
    }
}

export default Layout;