# InstaCook

## Overview
InstaCook is a complete AI-powered iOS and backend system that generates cooking recipes directly from social media content. By pasting a link from Instagram, TikTok, or YouTube, the app extracts text, metadata, and visual information, then analyzes it using AI to create a structured recipe with cooking steps and converted ingredient measurements shown in both US customary and metric units. This single document should be used as your combined README.md file and one-shot AI coding prompt.

---

## GitHub Setup
1. Create a new GitHub repository named `InstaCook`.
2. Add this entire content as your root-level `README.md` file.
3. This document instructs the AI coding assistant to generate all project files automatically, including iOS frontend, backend, database schema, and configurations.
4. The final repository will include:
   - SwiftUI-based iOS frontend using MVVM.
   - Node.js backend (Express) with PostgreSQL through Neon.
   - Authentication powered by Clerk.
   - CDN and caching handled by Cloudflare.
   - Hosting on Render with environment variables for all relevant services.

---

## Key Features
- Accept URLs from Instagram, TikTok, and YouTube.
- AI processing to transform videos or captions into structured recipes.
- Ingredient conversion between US customary and metric.
- Secure login via Clerk.
- Persistent storage for recipes linked to authenticated users.
- Backend scalability via Neon, Render, and Cloudflare.
- Modern SwiftUI interface optimized for performance.
- Optional social recipe sharing.

---

## Architecture Summary

### iOS App (Frontend)
- Built entirely in SwiftUI.
- Architecture pattern: MVVM.
- Core Views:
  - `MainView`: Input field for link and generate button.
  - `RecipeView`: Displays generated recipe data.
  - `AuthView`: Sign-in and user management using Clerk.
  - `LoadingView`: Animated progress display.
- Models: `Recipe`, `Ingredient`, and `User`.
- Async/await-based `NetworkService` for API requests.
- Handles adaptive design for various devices and light/dark modes.

### Backend (Server)
- Developed using Node.js + Express.
- PostgreSQL database (Neon).
- Routes for authentication, processing, generating, and saving user recipes.
- Services for:
  - Social content parsing (Instagram, TikTok, YouTube).
  - AI processing for structured recipe generation.
  - Unit conversion utilities for metric and US systems.
- Middleware for errors, validation, and authentication.
- Cloudflare integration for image caching and routing.
- Hosted on Render, environmentally configured through JSON-based settings.

---

## API Endpoints

### POST /process
Parses content from a provided URL, extracting captions, frames, and key metadata.

Example Request:
{ "url": "https://www.tiktok.com/@chefemma/video/12345" }
Example Response:
{"postId": "tk12345","source": "tiktok","caption": "Quick creamy mushroom pasta!","media": "https://cdn.instacook.io/media/frame1.jpg"}

---

### POST /generate
Uses parsed content and AI to create a clean structured recipe.

Example Request:
{"source": "tiktok","caption": "Quick creamy mushroom pasta!","media": "https://cdn.instacook.io/media/frame1.jpg"}
Example Response:
{"recipe": {"title": "Creamy Mushroom Pasta","ingredients": { "name": "Pasta", "metric": "250 g", "us": "9 oz" },{ "name": "Mushrooms", "metric": "150 g", "us": "1.5 cups" },{ "name": "Cream", "metric": "120 ml", "us": "0.5 cup" },"instructions": "Boil pasta until tender.","Sauté mushrooms in butter.","Add cream and combine with pasta.","prepTime": "20 minutes","servings": 2}}

---

### POST /recipes
Stores a generated recipe under the logged-in user's account.

Example:
{"userId": "usr098","recipe": {"title": "Creamy Mushroom Pasta","ingredients": "…","instructions": "…"}}
Response:
{ "status": "success", "recipeId": "r001" }

---

### GET /recipes
Retrieves all saved recipes for an authenticated user.
{"title": "Creamy Mushroom Pasta", "createdAt": "2025-11-17" },{"title": "Garlic Shrimp", "createdAt": "2025-11-15" }


---

### DELETE /recipes
Removes a saved recipe.
{ "recipeId": "r001" }

---

## Backend Directory Layout
Backend/
├── server.js
├── Routes/
│   ├── auth.js
│   ├── process.js
│   ├── generate.js
│   ├── recipes.js
├── Controllers/
│   ├── authController.js
│   ├── recipeController.js
│   ├── generateController.js
├── Utils/
│   ├── socialParser.js
│   ├── aiProcessor.js
│   ├── unitConversion.js
├── Middleware/
│   ├── authCheck.js
│   ├── errorHandler.js
├── Database/
│   ├── schema.sql
│   └── connection.js
└── Config/
├── environment.json
├── services.json
└── constants.json

---

## iOS Directory Layout
iOSApp/
├── InstaCookApp.swift
├── Views/
│   ├── MainView.swift
│   ├── RecipeView.swift
│   ├── LoadingView.swift
│   ├── AuthView.swift
├── Models/
│   ├── Recipe.swift
│   ├── Ingredient.swift
│   ├── User.swift
└── ViewModels/
├── RecipeViewModel.swift
├── AuthViewModel.swift
├── NetworkService.swift

---

## Swift Data Models
struct Recipe: Codable {let title: String;let ingredients: Ingredient;let instructions: String;let prepTime: String;let servings: Int}
struct Ingredient: Codable {let name: String;let metric: String;let us: String}

---

## Database Schema Overview
Tables:
- **users**: Stores account data.
- **recipes**: User-linked recipe records.
- **ingredients**: Ingredient details linked to recipe_id.
- **sources**: Metadata for social media sources (Instagram, TikTok, YouTube).

---

## Data Flow
1. User pastes a URL (Instagram, TikTok, or YouTube).
2. URL sent to `/process` route → data extraction.
3. Media and text analyzed by AI through `/generate`.
4. Recipe returned to frontend and formatted in SwiftUI.
5. Logged-in users can save, retrieve, or delete recipes.

---

## Technology Stack
- **Frontend:** SwiftUI, MVVM, Codable model system.
- **Backend:** Node.js, Express, PostgreSQL (Neon).
- **Auth:** Clerk.
- **Hosting:** Render.
- **CDN:** Cloudflare.
- **AI Processing:** Dedicated backend utility module with natural language extraction and text structuring capabilities.

---

## Expansion Roadmap
- Support for Pinterest and Facebook videos.
- Multi-language recipe generation.
- Grocery list creation and nutritional breakdown.
- Offline recipe caching.
- In-app editing to customize AI output.

---

## License
MIT License © 2025 InstaCook

---

# AI CODE GENERATION PROMPT STARTS HERE

You are to automatically build the complete InstaCook application using the specifications above. Generate:

1. A fully functional SwiftUI iOS frontend, including all code files, MVVM structure, and Swift data models.
2. A complete Node.js/Express backend integrated with Neon PostgreSQL, Clerk authentication, and Cloudflare CDN.
3. Configuration files matching environment.json and database schema.sql definitions.
4. APIs that seamlessly connect frontend Codable models to backend JSON endpoints.
5. Inline comments explaining file purposes and logic.
6. All SwiftUI and backend directories identical to the structures listed above.
7. Full multi-platform support for Instagram, TikTok, and YouTube ingestion in the `socialParser.js` utility.
8. AI-powered recipe formatting that outputs ingredients in both metric and US units.
9. A rendered README.md identical to this layout upon project completion.
10. No external setup commands—only pure, descriptive, structured, compilable code and configuration.
