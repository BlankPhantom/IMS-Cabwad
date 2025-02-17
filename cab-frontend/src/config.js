const BASE_URL = 'http://127.0.0.1:8000/';

export const API_ENDPOINTS = {
    BASE: `${BASE_URL}`,

    //User Endpoints
    LOGIN: `${BASE_URL}ims/login/`,
    CREATE_USER: `${BASE_URL}ims/create_user`,
    TOKEN: `${BASE_URL}ims/token/`,

    //Item Endpoints
    ITEM_LIST: `${BASE_URL}ims/item/`,
    ADD_ITEM: `${BASE_URL}ims/item/create/`,
    UPDATE_ITEM:(itemID) => `${BASE_URL}ims/item/update/${itemID}/`,
    DELETE_ITEM:(itemID) => `${BASE_URL}ims/item/delete/${itemID}/`,
    
    CLASSIFICATIONS_LIST: `${BASE_URL}ims/classification/`,
    MEASUREMENTS_LIST: `${BASE_URL}ims/measurement/`,
    SECTION_LIST: `${BASE_URL}ims/section/`,
};