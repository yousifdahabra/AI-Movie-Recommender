const loginForm = document.getElementById('loginForm');
const signupForm = document.getElementById('signupForm');
const loginAction = document.getElementById('login-action');

loginAction.addEventListener('click', e => {
    togglePassword('loginPassword');
});

const signupAction = document.getElementById('signup-action');

signupAction.addEventListener('click', e => {
    togglePassword('signupPassword');
})

loginForm.addEventListener('submit', handleLogin);
signupForm.addEventListener('submit', handleSignup);

async function handleLogin(event) {
    event.preventDefault();

    const email = document.getElementById('loginEmail').value;
    const password = document.getElementById('loginPassword').value;

    try {
        const response = await fetch('http://localhost/AI-Movie-Recommender/server/authentication/login.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({username: email, password})
        });

        const data = await response.json();

        if (data.success) {
            localStorage.setItem('user', JSON.stringify(data.user));
            window.location.href = '/dashboard';
        } else {
            showError('loginEmailError', data.message);
            showError('loginPasswordError', data.message);
        }
    } catch (error) {
        console.error('Error logging in:', error);
        showError('loginEmailError', 'An error occurred. Please try again later.');
        showError('loginPasswordError', 'An error occurred. Please try again later.');
    }
}

async function handleSignup(event) {
    event.preventDefault();

    const name = document.getElementById('signupName').value;
    const email = document.getElementById('signupEmail').value;
    const password = document.getElementById('signupPassword').value;

    try {
        const response = await fetch('http://localhost/AI-Movie-Recommender/server/authentication/signup.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({fullName: name, username: email, password})
        });

        const data = await response.json();

        if (data.success) {
            showSuccess('Signup successful! Please log in.');
        } else {
            showError('signupNameError', data.message);
            showError('signupEmailError', data.message);
            showError('signupPasswordError', data.message);
        }
    } catch (error) {
        console.error('Error signing up:', error);
        showError('signupNameError', 'An error occurred. Please try again later.');
        showError('signupEmailError', 'An error occurred. Please try again later.');
        showError('signupPasswordError', 'An error occurred. Please try again later.');
    }
}

function showError(id, message) {
    document.getElementById(id).textContent = message;
}

function showSuccess(message) {
    alert(message);
}

function toggleForms() {
    const loginForm = document.querySelector('.login-form');
    const signupForm = document.querySelector('.signup-form');
    loginForm.classList.toggle('active');
    signupForm.classList.toggle('active');
}

function togglePassword(inputId) {
    const input = document.getElementById(inputId);
    const icon = input.parentElement.querySelector('.password-toggle i');
    input.type = input.type === 'password' ? 'text' : 'password';
    icon.classList.toggle('fa-eye');
    icon.classList.toggle('fa-eye-slash');
}

