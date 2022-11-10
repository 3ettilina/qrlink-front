import axios from 'axios';

const instance = axios.create({ baseURL: "http://qrlink-dev.rj.r.appspot.com/" });

export default instance;