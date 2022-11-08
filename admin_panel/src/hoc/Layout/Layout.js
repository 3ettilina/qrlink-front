import React, { Component } from 'react';
import './Layout.css';
import Toolbar from '../../components/Navigation/Toolbar/Toolbar.js';
import Resource from '../../components/Resource/Resource';

class Layout extends Component {
    render(){
        return(
            <div>
                <Toolbar />
                <div className='Componentes'>
                    
                </div>
            </div>
        );
    }
}

export default Layout;