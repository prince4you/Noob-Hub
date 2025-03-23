#!/bin/bash

# ------------------------
#    Noob Cyber Tech
#    Author: Sunil
#    Version: 3.0
#    License: MIT
# ------------------------

# ✅ Symbols
SUCCESS="✅"
ERROR="❌"
INFO="➤"
ARROW="➡"

# 🎨 Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
RESET='\033[0m'

# 🎨 Random Color Function
random_color() {
    COLORS=("$RED" "$GREEN" "$YELLOW" "$BLUE" "$MAGENTA" "$CYAN" "$WHITE")
    echo -e "${COLORS[$RANDOM % ${#COLORS[@]}]}"
}

# 🎭 Banner
banner() {
    COLOR=$(random_color)
    echo -e "${COLOR}"
    cat << "EOF"
███╗   ██╗ ██████╗  ██████╗ ██████╗ ██╗  ██╗██╗   ██╗██████╗ 
████╗  ██║██╔═══██╗██╔═══██╗██╔══██╗██║  ██║██║   ██║██╔══██╗
██╔██╗ ██║██║   ██║██║   ██║██████╔╝███████║██║   ██║██████╔╝
██║╚██╗██║██║   ██║██║   ██║██╔══██╗██╔══██║██║   ██║██╔══██╗
██║ ╚████║╚██████╔╝╚██████╔╝██████╔╝██║  ██║╚██████╔╝██████╔╝
╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
  🚀 Noob Cyber Tech | GitHub Authentication Setup 🚀
EOF
    echo -e "${RESET}"
}

# 📦 besic Packages installer
dependencies=("python" "vim" "neovim" "neofetch" "git" "curl" "termux-api" "proot-distro")

# 📂 Function to Check & Install Dependencies
install_packages() {
    echo -e "${CYAN}🔍 Checking & Installing Packages...${RESET}"

    for package in "${dependencies[@]}"; do
        # Check if the package is installed
        if ! dpkg -s "$package" &> /dev/null; then
            echo -e "${YELLOW}📥 Installing $package...${RESET}"
            
            # Install package using Nala
            if nala install -y "$package"; then
                echo -e "${GREEN}${SUCCESS} $package installed successfully!${RESET}"
            else
                echo -e "${RED}${ERROR} Failed to install $package!${RESET}"
            fi
        else
            echo -e "${GREEN}${SUCCESS} $package is already installed. Skipping...${RESET}"
        fi
    done
}

install_dependencies() {
    echo -e "${CYAN}🔍 Checking & Installing Dependencies...${RESET}"

    # Required Packages List
    packages=("git" "gh" "nala" "termux-apt-repo" "gnupg")

    # Install Loop
    for package in "${packages[@]}"; do
        if dpkg -s "$package" &>/dev/null; then
            echo -e "${GREEN}✅ $package is already installed.${RESET}"
        else
            echo -e "${YELLOW}⚡ Installing $package...${RESET}"
            apt install -y "$package" &>/dev/null && \
                echo -e "${GREEN}✅ $package installed successfully.${RESET}" || \
                echo -e "${RED}❌ Failed to install $package!${RESET}"
        fi
    done
}


# 💾 Display Progress Bar Function
progress_bar() {
    # Creating a simple progress bar
    echo -e "${CYAN}⬇️ Installing Packages...${RESET}"
    sleep 1
    for i in {1..15}; do
        echo -ne "\033[1;32m=\033[0m"
        sleep 0.3
    done
    echo -e "\n${GREEN}${SUCCESS} Installation Complete!${RESET}"
}


# 🛠️ Git Configuration
git_config() {
    echo -e "${BLUE}${INFO} Configuring Git...${RESET}"
    read -p "Enter your GitHub email: " email
    read -p "Enter your GitHub username: " username
    
    git config --global user.email "$email"
    git config --global user.name "$username"
    
    echo -e "${GREEN}${SUCCESS} Git configured successfully!${RESET}"
}

# 🔑 GitHub Authentication
github_auth() {
    echo -e "${BLUE}${INFO} Authenticating GitHub CLI...${RESET}"
    gh auth login
    progress_bar
    
    if [[ $? -eq 0 ]]; then
        echo -e "${GREEN}${SUCCESS} GitHub authentication complete!${RESET}" 
    else
        echo -e "${RED}${ERROR} GitHub authentication failed!${RESET}"
    fi
}

# 🔗 Noob Hackers Repo Setup
noobhackers_repo_setup() {
    echo -e "${YELLOW}${INFO} Setting up NoobHackers Repo...${RESET}"
    progress_bar
    curl -sSL https://raw.githubusercontent.com/prince4you/Noob-Hackers/refs/heads/main/addrepo.sh | bash
    
    if [[ $? -eq 0 ]]; then
        echo -e "${GREEN}${SUCCESS} NoobHackers repo setup completed!${RESET}"
    else
        echo -e "${RED}${ERROR} Failed to set up NoobHackers repo!${RESET}"
    fi
}

# 🌐 Social Media Function
social_media() {
     clear
     banner
    echo -e "${CYAN}${ARROW} Choose the social media platform to open:${RESET}"
    echo -e "${GREEN}1️[1]YouTube${RESET}"
    echo -e "${GREEN}2️[2]Instagram${RESET}"
    echo -e "${RED}3️[3]Twitter${RESET}"
    echo -e "${YELLOW} [4]Facebook${RESET}"
    echo -e "${YELLOW}5️[5]WhatsApp${RESET}"
    
    read -p "Enter your choice: " choice
    
    case $choice in
        1) xdg-open https://youtube.com/@noobcybertech2024?si=MVKSaevhkBnmceKZ ;;
        2) xdg-open https://instagram.com/annon_4you ;;
        3) xdg-open https://twitter.com/NoobCyberTech ;;
        4) xdg-open https://www.facebook.com/share/1HrTAb9GoH/ ;;
        5) xdg-open https://chat.whatsapp.com/DQHA1MZ46RYGlyIIOPZR2T ;;
        *) echo -e "${RED}${ERROR} Invalid choice!${RESET}" ;;
    esac
}

# 📜 Main Menu
main_menu() {
    while true; do
        clear
        banner
        echo -e "${BLUE}📌 Select an option:${RESET}"
        echo -e "${GREEN}[1]Social Media Links${RESET}"
        echo -e "${GREEN}[2]Install Basic Packages${RESET}"
        echo -e "${GREEN}[3]Install Git CLI Setup${RESET}"
        echo -e "${RED}[4]Noob Hackers Repo Setup${RESET}"
        echo -e "${YELLOW}[5]Dependency Installation${RESET}"
        echo -e "${YELLOW}[6]About Me${RESET}"
        echo -e "${YELLOW}[7]Exit${RESET}"
        
        read -p "Enter your choice: " choice
        
        case $choice in
            1) social_media ;;
            2) install_packages && progress_bar ;;
            3) git_config && github_auth ;;
            4) noobhackers_repo_setup ;;
            5) install_dependencies ;; 
            6) echo -e "${BLUE}${INFO} Author: Sunil | Noob Cyber Tech ${RESET}" ;;
            7) exit ;;
            *) echo -e "${RED}${ERROR} Invalid choice!${RESET}" ;;
        esac
        
        echo -e "${YELLOW}Press Enter to continue...${RESET}"
        read
    done
}

# 🚀 Start the main menu
main_menu
