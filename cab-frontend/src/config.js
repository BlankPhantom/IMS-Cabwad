const BASE_URL = 'http://127.0.0.1:8000/';

export const API_ENDPOINTS = {
    BASE: `${BASE_URL}`,

    //Item Endpoints
    ITEM_LIST: `${BASE_URL}ims/item/`,
    ADD_ITEM:`${BASE_URL}ims/item/create/`,
    UPDATE_ITEM:(itemID) => `${BASE_URL}/ims/item/${itemID}`,
    DELETE_ITEM: (itemID) => `${BASE_URL}ims/item/${itemID}/`,
    
    CLASSIFICATIONS_LIST: `${BASE_URL}ims/classification/`,
    MEASUREMENTS_LIST: `${BASE_URL}ims/measurement/`,
};