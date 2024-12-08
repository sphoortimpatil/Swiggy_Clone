# Swiggy Food Page Clone iOS App

This app replicates the Swiggy food page with a vertically scrolling interface, a sticky header, multiple sections, smooth navigation, and a tab widget for enhanced usability. Built entirely using **UIKit**, the app demonstrates core iOS development concepts.

---

## 📋 Features

### 1. **Sticky Header**  
A sticky header implemented using **UIView** remains fixed at the top of the screen. This includes an address, a search bar, and a profile icon.
The **UITableView** starts below the header and provides vertical scrolling.

### 2. **Vertical Collection with Multiple Sections**  
A **UITableView** with sections displays a vertically scrolling layout, including horizontal image banners and restaurant collections using **UICollectionView** within cells.

### 3. **Horizontal Scroll Section**  
A horizontally scrolling **UICollectionView** showcases images in a clean, swipeable layout for banners and restaurants.

### 4. **Pull-to-Refresh**  
Added **UIRefreshControl** to allow refreshing the list content by pulling down below the sticky header.

### 5. **Cell Navigation**  
Tapping on an image cell navigates to a details page using **UINavigationController**, displaying the details with a **UIImageView** and **UILabel**.

### 6. **Tab Widgets**  
Implemented tab widgets using a horizontal **UICollectionView** in between the screen.  
- Selecting a tab displays the food sections related to the chosen category dynamically below the sticky header.
---


## 🛠️ UIKit Elements Used
- **UIView:** For implementing the sticky header.
- **UITableView:** For vertical scrolling with sections.
- **UICollectionView:** For horizontal scrolling banners and restaurants.
- **UINavigationController:** For navigating between the food page and details page.
- **UIImageView & UILabel:** To display images and text content across the app.
- **UIRefreshControl:** For pull-to-refresh functionality.  
- **UITabBarController:** For tab navigation as a bonus feature.

---

This app is optimized for smooth performance and seamless user experience while adhering to UIKit principles.
