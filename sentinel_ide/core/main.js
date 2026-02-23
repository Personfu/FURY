/**
 * FURY Sentinel IDE: Main Process
 * Electron-based Intelligence Interface
 */

const { app, BrowserWindow, ipcMain } = require('electron');
const path = require('path');
const SentinelEngine = require('./engine');

function createWindow() {
    const win = new BrowserWindow({
        width: 1200,
        height: 800,
        titleBarStyle: 'hidden',
        backgroundColor: '#0a0a0a',
        webPreferences: {
            nodeIntegration: true,
            contextIsolation: false
        }
    });

    // In a real build, we would load a React/Vite dev server or build folder
    // For this concept, we load a simple dashboard HTML
    win.loadFile('../ui/dashboard.html');

    // Initialize Intelligence Engine
    const engine = new SentinelEngine();
    engine.syncWithNebula();
}

app.whenReady().then(() => {
    createWindow();

    app.on('activate', () => {
        if (BrowserWindow.getAllWindows().length === 0) createWindow();
    });
});

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') app.quit();
});
