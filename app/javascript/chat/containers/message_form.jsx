import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { createMessage } from '../actions/index';
import {BsFillCaretRightFill} from 'react-icons/bs'

class MessageForm extends Component {
  constructor(props) {
    super(props);
    this.state = { value: '' };
  }

  componentDidMount() {
    this.messageBox.focus();
  }

  handleChange = (event) => {
    this.setState({ value: event.target.value });
  }

  handleSubmit = (event) => {
    event.preventDefault();
    this.props.createMessage(this.props.selectedChannel, this.state.value);
    this.setState({ value: '' });
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit} className="channel-editor">
        <input
          ref={input => this.messageBox = input}
          type="text"
          className="form-control border-right-0"
          autoComplete="off"
          value={this.state.value}
          onChange={this.handleChange}
          placeholder="Write your messages here 💥 ⚡️ 🐒 🦦 🦥 🐲 🐉 🧟‍♂️ 👻 👽 🥷🏾 🦹‍♀️ "
        />
        <button className="msg-btn" type="submit"><BsFillCaretRightFill/></button>
      </form>
    );
  }
}

function mapStateToProps(state) {
  return {
    messages: state.messages,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ createMessage }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(MessageForm);
