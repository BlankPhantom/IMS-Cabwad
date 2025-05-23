const BASE_URL = "http://127.0.0.1:8000/";
// const BASE_URL = "https://imscabwad.pythonanywhere.com/";

export const API_ENDPOINTS = {
    BASE: `${BASE_URL}`,

    //User Endpoints
    LOGIN: `${BASE_URL}ims/login/`,
    CREATE_USER: `${BASE_URL}ims/create_user/`,
    USER_LIST: `${BASE_URL}ims/users/`,
    UPDATE_USER: (userID) => `${BASE_URL}ims/update_user/${userID}/`,
    DELETE_USER: (userID) => `${BASE_URL}ims/delete_user/${userID}/`,
    TOKEN: `${BASE_URL}ims/token/`,
    TOGGLE_USER_ACTIVATION: `${BASE_URL}ims/toggle_user_activation`, // Add this line
    UPDATE_PASSWORD: `${BASE_URL}ims/update_password/`, // Add this line

    //Item Endpoints
    ITEM_LIST: `${BASE_URL}ims/item/`,
    PRODUCT_LIST: `${BASE_URL}ims/item/products/`,
    ITEM_SEARCH: `${BASE_URL}ims/search-item/`,
    ADD_ITEM: `${BASE_URL}ims/item/create/`,
    UPDATE_ITEM: (itemID) => `${BASE_URL}ims/item/update/${itemID}/`,
    DELETE_ITEM: (itemID) => `${BASE_URL}ims/item/delete/${itemID}/`,

    //Beginning Balance Endpoint
    BEGINNING_BAL_LIST: `${BASE_URL}ims/beginning-bal/`,
    BEGINNING_BAL_SEARCH: `${BASE_URL}ims/search-beginning-bal/`,
    BEGINNING_BAL_CREATE: `${BASE_URL}ims/copy-items/`,

    //Running Balance Endpoint
    RUNNING_BAL_LIST: `${BASE_URL}ims/run-bal/`,
    RUNNING_BAL_SEARCH: `${BASE_URL}ims/search-run-bal/`,
    RUNNING_BAL_CREATE: `${BASE_URL}ims/run-bal/create/`,
    RUNNING_BAL_TOGGLE: (id) => `${BASE_URL}ims/run-bal/toggle/${id}/`,
    
    //Monthly Consumption Endpoint
    MONTHLY_CONSUMPTION: `${BASE_URL}ims/monthly-consumption/`,
    MONTHLY_CONSUMPTION_SEARCH: `${BASE_URL}ims/search-monthly-consumption/`,
    EXPORT_CONSUMPTION: `${BASE_URL}ims/export-consumption/`,

    // Transaction Endpoints (Considering transaction details and products as one)
    TRANSACTION_LIST: `${BASE_URL}ims/transaction-detail/`,
    TRANSACTION_PRODUCTS_ALL: `${BASE_URL}ims/transaction-product/`,
    TRANSACTION_DETAILS: (id) => `${BASE_URL}ims/transaction-detail/${id}/`, // Get single transaction detail
    ADD_TRANSACTION: `${BASE_URL}ims/transaction-detail/create/`, // Create a new transaction
    UPDATE_TRANSACTION: (id) => `${BASE_URL}ims/transaction-detail/update/${id}/`, // Update a transaction
    DELETE_TRANSACTION: (id) => `${BASE_URL}ims/transaction-detail/delete/${id}/`, // Delete a transaction

    // Transaction Products (Nested within transactions)
    TRANSACTION_PRODUCTS: (detailID) => `${BASE_URL}ims/transaction-product/?detailID=${detailID}`, // Get all products under a transaction
    TRANSACTION_PRODUCT_DETAILS: (detailID, id) => `${BASE_URL}ims/transaction-product/${detailID}/${id}/`, // Get single product in a transaction
    ADD_TRANSACTION_PRODUCT: `${BASE_URL}ims/transaction-product/create/`, // Create a transaction product
    UPDATE_TRANSACTION_PRODUCT: (detailID, id) => `${BASE_URL}ims/transaction-product/update/${detailID}/${id}/`, // Update a product in a transaction
    DELETE_TRANSACTION_PRODUCT: (detailID, id) => `${BASE_URL}ims/transaction-product/delete/${detailID}/${id}/`, // Delete a product in a transaction

    TRANSACTION_HISTORY: `${BASE_URL}ims/transaction-history`,

    FETCH_TRANSACTIONS: `${BASE_URL}ims/transaction-detail/`,

    CLASSIFICATIONS_LIST: `${BASE_URL}ims/classification/`,
    MEASUREMENTS_LIST: `${BASE_URL}ims/measurement/`,
    SECTION_LIST: `${BASE_URL}ims/section/`,
    PURPOSE_LIST: `${BASE_URL}ims/purpose/`,
    AREA_LIST: `${BASE_URL}ims/area/`,
    DOWNLOAD_REPORTS:(year, month) => `${BASE_URL}ims/download-report/${year}/${month}/`,

    BACKUP: `${BASE_URL}backup/backup/`,
    RESTORE: `${BASE_URL}backup/restore/`,

};
