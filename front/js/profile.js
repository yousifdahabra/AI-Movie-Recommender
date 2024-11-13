const oldPasswordInput = document.getElementById('oldPassword');
const newNameInput = document.getElementById('newName');
const newEmailInput = document.getElementById('newEmail');
const newPasswordInput = document.getElementById('newPassword');
const saveButton = document.getElementById('saveButton');
const profileForm = document.getElementById('profileForm');

window.addEventListener('DOMContentLoaded', async () => {
    const response = await fetch('http://localhost/AI-Movie-Recommender/server/authentication/get_profile.php');
    const data = await response.json();

    if (data.success) {
        newNameInput.value = data.data.name;
    }
});

oldPasswordInput.addEventListener('input', () => {
    const isOldPasswordEntered = oldPasswordInput.value;
    newNameInput.disabled = !isOldPasswordEntered;
    newEmailInput.disabled = !isOldPasswordEntered;
    newPasswordInput.disabled = !isOldPasswordEntered;
    saveButton.disabled = !isOldPasswordEntered;
});

async function handleSave() {
    let valid = true;

    const errorElements = document.querySelectorAll('.error-message');
    errorElements.forEach(el => el.style.display = 'none');

    if (newNameInput.value === "") {
        document.getElementById('newNameError').style.display = "block";
        valid = false;
    }

    if (newPasswordInput.value.length < 6) {
        document.getElementById('newPasswordError').style.display = "block";
        valid = false;
    }

    if (valid) {
        const response = await fetch('http://localhost/AI-Movie-Recommender/server/authentication/update_profile.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                oldPassword: oldPasswordInput.value,
                newName: newNameInput.value,
                newPassword: newPasswordInput.value
            })
        });

        const data = await response.json();

        if (data.success) {
            alert('Profile updated successfully!');
            oldPasswordInput.value = '';
            newPasswordInput.value = '';

            newNameInput.disabled = true;
            newEmailInput.disabled = true;
            newPasswordInput.disabled = true;
            saveButton.disabled = true;
        } else {
            if (data.field) {
                document.getElementById(`${data.field}Error`).style.display = "block";
                document.getElementById(`${data.field}Error`).textContent = data.message;
            }
        }
    }
}

// Add password visibility toggle function if needed
function togglePassword(inputId) {
    const input = document.getElementById(inputId);
    const icon = input.parentElement.querySelector('.fa-eye, .fa-eye-slash');

    if (input.type === 'password') {
        input.type = 'text';
        icon.classList.remove('fa-eye');
        icon.classList.add('fa-eye-slash');
    } else {
        input.type = 'password';
        icon.classList.remove('fa-eye-slash');
        icon.classList.add('fa-eye');
    }
}