const oldPasswordInput = document.getElementById('oldPassword');
const newNameInput = document.getElementById('newName');
const newEmailInput = document.getElementById('newEmail');
const newPasswordInput = document.getElementById('newPassword');
const saveButton = document.getElementById('saveButton');

oldPasswordInput.addEventListener('input', () => {
    const isOldPasswordEntered = oldPasswordInput.value;
    newNameInput.disabled = !isOldPasswordEntered;
    newEmailInput.disabled = !isOldPasswordEntered;
    newPasswordInput.disabled = !isOldPasswordEntered;
    saveButton.disabled = !isOldPasswordEntered;
});

function handleSave() {
    let valid = true;

    if (newNameInput.value === "") {
        document.getElementById('newNameError').style.display = "block";
        valid = false;
    } else {
        document.getElementById('newNameError').style.display = "none";
    }

    if (newEmailInput.value === "" || !newEmailInput.value.includes("@")) {
        document.getElementById('newEmailError').style.display = "block";
        valid = false;
    } else {
        document.getElementById('newEmailError').style.display = "none";
    }

    if (newPasswordInput.value.length < 6) {
        document.getElementById('newPasswordError').style.display = "block";
        valid = false;
    } else {
        document.getElementById('newPasswordError').style.display = "none";
    }

    if (valid) {
        alert('Changes saved! (Demo)');
    }
}