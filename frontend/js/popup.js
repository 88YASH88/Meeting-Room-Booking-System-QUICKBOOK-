// Function to open the popup
function openCustomPopup(message, onConfirm) {
    // Remove existing popup if it exists
    let existingPopup = document.getElementById("customPopup");
    if (existingPopup) existingPopup.remove();

    // Create modal container
    let modal = document.createElement("div");
    modal.id = "customPopup";
    modal.classList.add("fixed", "inset-0", "flex", "items-center", "justify-center", "z-50", "bg-gray-900", "bg-opacity-50");

    // Create popup content
    let popupBox = document.createElement("div");
    popupBox.classList.add("bg-white", "p-6", "rounded-lg", "shadow-xl", "w-1/3", "text-center");

    // Modal title
    let title = document.createElement("h3");
    title.classList.add("text-lg", "font-semibold", "text-gray-900");
    title.innerText = "Confirmation";

    // Message inside the modal
    let messageText = document.createElement("p");
    messageText.classList.add("text-sm", "text-gray-600", "mt-2");
    messageText.innerText = message;

    // Button container
    let buttonContainer = document.createElement("div");
    buttonContainer.classList.add("mt-4", "flex", "justify-center", "gap-4");

    // "Yes" button
    let yesButton = document.createElement("button");
    yesButton.classList.add("px-4", "py-2", "bg-red-600", "text-white", "rounded", "hover:bg-red-700");
    yesButton.innerText = "Yes";
    yesButton.onclick = function () {
        document.body.removeChild(modal);
        if (onConfirm) onConfirm(); // Execute callback function if provided
    };

    // "No" button
    let noButton = document.createElement("button");
    noButton.classList.add("px-4", "py-2", "bg-gray-300", "text-gray-700", "rounded", "hover:bg-gray-400");
    noButton.innerText = "No";
    noButton.onclick = function () {
        document.body.removeChild(modal);
    };

    // Append elements
    buttonContainer.appendChild(yesButton);
    buttonContainer.appendChild(noButton);
    popupBox.appendChild(title);
    popupBox.appendChild(messageText);
    popupBox.appendChild(buttonContainer);
    modal.appendChild(popupBox);
    document.body.appendChild(modal);
}
