import React, { Component }  from 'react';
import './Toolbar.css';

class Toolbar extends Component {
    render() {
        return (
            <div className='Toolbar'>
                <div className='Toolbar-header'>
                    <h1>
                    QR Link
                    </h1>
                    <p>
                    Panel de administración
                    </p>
                </div>            
            </div>
        );
    }
}


export default Toolbar;