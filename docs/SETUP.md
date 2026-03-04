# Deployment Instructions

## Setup Guide

### Prerequisites
- Ensure you have the following software installed:
  - [Node.js](https://nodejs.org/)
  - [npm](https://www.npmjs.com/)

### Steps to Deploy
1. **Clone the repository**:
   ```bash
   git clone https://github.com/lrsolorzano/configLabSec.git
   cd configLabSec
   ```
2. **Install dependencies**:
   ```bash
   npm install
   ```
3. **Run the application**:
   ```bash
   npm start
   ```

### Environment Variables
- Set the following environment variables in your `.env` file:
  - `DATABASE_URL`: Your database connection string
  - `PORT`: The port you want to run the application on (default is 3000)

### Testing the Setup
- After setup, access the application by navigating to `http://localhost:3000` in your web browser.

For any issues, check the console for errors or refer to the documentation.

---