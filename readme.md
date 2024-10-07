
---

# **Unbrick Your OnePlus Phone: A Step-by-Step Guide**

Have you accidentally bricked your OnePlus phone after flashing an unsupported ROM, attempting to root it, or installing Pixel OS and now need to return to Oxygen OS? Don’t worry—you’re in the right place! This guide will walk you through the process of restoring your device in 3 simple steps.

### **Common Causes of Bricking:**
- Flashing unsupported ROMs or recovery images.
- Unsuccessful attempts to root your device.
- Installing Pixel OS and wanting to switch back to Oxygen OS.

### **Follow these steps carefully to restore your device:**

---

## **Step 1: Download the Original ROM**

1. Go to the OnePlus Community and search for the official Oxygen OS ROM for your device. Alternatively, Google “`<device name> Oxygen OS download`” to find ROMs for your specific model. 
    - For example, you can check out community threads like [this one](https://community.oneplus.com/thread/1231470507946672129) where users share links to ROMs, including older versions.
    - **Tip**: If the latest ROM is unavailable on the forums, you can usually find earlier versions that allow downgrading.
2. Download the desired ROM as a ZIP file, which will contain the necessary files for the process.

---

## **Step 2: Extract Images Using Fastboot Enhance**

1. After downloading the ROM, locate the `payload.bin` file inside the ZIP.

2. Use a tool like [Fastboot Enhance](https://github.com/fastboot-enhance) or **payload_dumper** (for Ubuntu) to extract the images from `payload.bin`. These extracted files will be used to flash your phone.
   - If you're on **Ubuntu**, you can find tools like `payload_dumper` on GitHub for extraction.

3. Once the extraction is complete, ensure all necessary image files (`.img` files) are available. These should include files like `system.img`, `boot.img`, and others required for flashing.
   - Place all the `.img` files inside the `/unbrick-one-plus/` directory.
   - Create a `bin` directory inside `/unbrick-one-plus/` by running the following:
     ```bash
     mkdir /unbrick-one-plus/bin
     ```
   - Download **ADB** and **Fastboot** (Linux binaries for Ubuntu or `.exe` for Windows) and place them inside the `/unbrick-one-plus/bin` directory as well.

---


## **Step 3: Flash the Images**

1. Place the **Fastboot binary** (for Ubuntu/Linux) or **Fastboot executable** (for Windows) inside the `bin` folder.
2. Inside this repository, you’ll find a shell script (`.sh` file for Linux) or a batch file (`.bat` for Windows) that automates the flashing process.
    - Run the script appropriate for your OS.
    - If you prefer manual flashing, run the necessary `fastboot` commands to flash each image individually (e.g., `fastboot flash system system.img`, etc.).
3. **Important**: Double-check that all necessary images are present. Compare the extracted `.img` files with the ones listed in the script. Any unnecessary or missing files may cause issues during the flashing process.

---

### **Final Notes:**
- Ensure your **bootloader is unlocked** and **USB Debugging** is enabled before you start.
- If you encounter issues, check your Fastboot installation and ensure your USB connection is stable.
- Flashing incorrect images or skipping steps can cause further problems, so carefully follow the guide and verify every step.

---

### **Disclaimer:**
- The author of this guide is not responsible for any damage, data loss, or further bricking of your device. Proceed at your own risk.

Good luck, and happy unbricking!

---