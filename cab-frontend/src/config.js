const BASE_URL = "http://127.0.0.1:8000/";

export const API_ENDPOINTS = {
    BASE: `${BASE_URL}`,

    //User Endpoints
    LOGIN: `${BASE_URL}ims/login/`,
    CREATE_USER: `${BASE_URL}ims/create_user`,
    TOKEN: `${BASE_URL}ims/token/`,

    //Item Endpoints
    ITEM_LIST: `${BASE_URL}ims/item/`,
    ADD_ITEM: `${BASE_URL}ims/item/create/`,
    UPDATE_ITEM: (itemID) => `${BASE_URL}ims/item/update/${itemID}/`,
    DELETE_ITEM: (itemID) => `${BASE_URL}ims/item/delete/${itemID}/`,

    //Beginning Balance Endpoint
    BEGINNING_BAL_LIST: `${BASE_URL}ims/beginning-bal/`,

    //Running Balance Endpoint
    RUNNING_BAL_LIST: `${BASE_URL}ims/run-bal/`,
    RUNNING_BAL_CREATE: `${BASE_URL}ims/run-bal/create/`,

    //Monthly Consumption Endpoint
    MONTHLY_CONSUMPTION:`${BASE_URL}ims/monthly-consumption/`,

    // Transaction Endpoints (Considering transaction details and products as one)
    TRANSACTION_LIST: `${BASE_URL}ims/transaction-detail/`, // Get all transaction details
    TRANSACTION_DETAILS: (id) => `${BASE_URL}ims/transaction-detail/${id}/`, // Get single transaction detail
    ADD_TRANSACTION: `${BASE_URL}ims/transaction-detail/create/`, // Create a new transaction
    UPDATE_TRANSACTION: (id) => `${BASE_URL}ims/transaction-detail/update/${id}/`, // Update a transaction
    DELETE_TRANSACTION: (id) => `${BASE_URL}ims/transaction-detail/delete/${id}/`, // Delete a transaction

    // Transaction Products (Nested within transactions)
    TRANSACTION_PRODUCTS: (detailID) =>
        `${BASE_URL}ims/transaction-product/${detailID}`, // Get all products under a transaction
    TRANSACTION_PRODUCT_DETAILS: (detailID, id) =>
        `${BASE_URL}ims/transaction-product/${detailID}/${id}/`, // Get single product in a transaction
    ADD_TRANSACTION_PRODUCT: `${BASE_URL}ims/transaction-product/create/`, // Create a transaction product
    UPDATE_TRANSACTION_PRODUCT: (detailID, id) =>
        `${BASE_URL}ims/transaction-product/update/${detailID}/${id}/`, // Update a product in a transaction
    DELETE_TRANSACTION_PRODUCT: (detailID, id) =>
        `${BASE_URL}ims/transaction-product/delete/${detailID}/${id}/`, // Delete a product in a transaction

    FETCH_TRANSACTIONS: `${BASE_URL}ims/transaction-detail/`,

    CLASSIFICATIONS_LIST: `${BASE_URL}ims/classification/`,
    MEASUREMENTS_LIST: `${BASE_URL}ims/measurement/`,
    SECTION_LIST: `${BASE_URL}ims/section/`,
    PURPOSE_LIST: `${BASE_URL}ims/purpose/`,
    PRODUCT_LIST: `${BASE_URL}ims/product/`,
    AREA_LIST: `${BASE_URL}ims/area/`,
};
