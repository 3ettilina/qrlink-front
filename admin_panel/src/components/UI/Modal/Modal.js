import React, { Component } from 'react';

import classes from './Modal.module.css';
import Backdrop from '../Backdrop/Backdrop';
import IconButton from '@material-ui/core/IconButton';
import CloseIcon from '@material-ui/icons/Close';

class Modal extends Component {

    shouldComponentUpdate ( nextProps, nextState ) {
        return nextProps.show !== this.props.show || nextProps.children !== this.props.children;
    }
    
    render(){
        return (
            <React.Fragment>
                <Backdrop show={this.props.show} clicked={this.props.modalClosed} />
                <div
                    className={classes.Modal}
                    style={{
                        transform: this.props.show ? 'translateY(0)' : 'translateY(-100vh)',
                        opacity: this.props.show ? '1' : '0'
                    }}>
                    <div className={classes.Cruz}>
                        <IconButton color= 'inherit' onClick={() => { this.props.modalClosed(); this.reajustImage(); }}>
                            <CloseIcon style={{ fontSize: 27 }} />
                        </IconButton>
                    </div>
                    {this.props.children}
                </div>
            </React.Fragment>
        )
    }
}

export default Modal;