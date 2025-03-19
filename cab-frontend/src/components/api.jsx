export const fetchWithCSRF = async (url, options = {}) => {
    const csrfToken = document.cookie
        .split("; ")
        .find(row => row.startsWith("csrftoken"))
        ?.split("=")[1];

    const headers = {
        "Content-Type": "application/json",
        ...(csrfToken && { "X-CSRFToken": csrfToken }),  // Ensure CSRF token is included
        ...options.headers,
    };

    return fetch(url, {
        ...options,
        headers,
        credentials: "include",  // Ensure cookies (session) are sent
    });
};
