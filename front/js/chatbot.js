const API_KEY = "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";
const API_ENDPOINT = "https://api.openai.com/v1/chat/completions";
const prompt = "You are called Movie Wizard. You can only answer questions about movies or summarize movie plots. Do not provide any other information."

const chatMessages = document.getElementById('chat-messages');
const userInput = document.getElementById('user-input');
const sendButton = document.getElementById('send-button');
const typingIndicator = document.getElementById('typing-indicator');

function addMessage(message, isUser) {
    const messageDiv = document.createElement('div');
    messageDiv.className = `message ${isUser ? 'user-message' : 'bot-message'}`;
    messageDiv.textContent = message;
    chatMessages.appendChild(messageDiv);
    chatMessages.scrollTop = chatMessages.scrollHeight;
}

function showTypingIndicator() {
    typingIndicator.style.display = 'block';
    chatMessages.scrollTop = chatMessages.scrollHeight;
}

function hideTypingIndicator() {
    typingIndicator.style.display = 'none';
}

async function sendMessage(message) {
    try {
        showTypingIndicator();

        const response = await fetch(API_ENDPOINT, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${API_KEY}`
            },
            body: JSON.stringify({
                model: "gpt-3.5-turbo",
                messages: [{
                    role: "system",
                    content: prompt,
                }, {
                    role: "user",
                    content: message
                }],
            })
        });

        if (!response.ok) {
            throw new Error('API request failed');
        }

        const data = await response.json();
        console.log(data.choices[0].message.content);
        hideTypingIndicator();
        addMessage(data.choices[0].message.content, false);
    } catch (error) {
        console.error('Error:', error);
        hideTypingIndicator();
        addMessage('Try again', false);
    }
}

function handleSubmit() {
    const message = userInput.value.trim();
    if (message) {
        addMessage(message, true);
        userInput.value = '';
        sendMessage(message);
    }
}

sendButton.addEventListener('click', handleSubmit);