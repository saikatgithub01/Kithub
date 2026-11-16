<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KSP - Add Listing</title>
<jsp:include page="/components/Favicon.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/seller_dashboard.css">
</head>
<body>

<div class="ksp-page">
    <div class="ksp-bg"></div>
    <div class="ksp-overlay"></div>

    <nav class="ksp-nav">
        <a href="seller_dashboard.jsp" class="brand">Kithub<span>.</span></a>
    </nav>

    <main class="ksp-main" style="display: flex; justify-content: center;">
        
        <form action="${pageContext.request.contextPath}/AddListServlet" method="post" class="ksp-form-wide">
            <h2>Create New Listing</h2>
            
            <div class="ksp-form-grid">
                
                
                <div>
                    <label class="ksp-label">Item Type</label>
                    <select name="item_type" class="ksp-input" required>
                        <option value="Book">Book</option>
                        <option value="Notebook">Notebook</option>
                    </select>
                </div>
                <div>
                    <label class="ksp-label">Listing Type</label>
                    <select name="listing_type" class="ksp-input" required>
                        <option value="Sale">Sale</option>
                        <option value="Lend">Lend</option>
                    </select>
                </div>
                <div>
                    <label class="ksp-label">Title</label>
                    <input type="text" name="title" class="ksp-input" placeholder="e.g. Physics Vol 1" required>
                </div>

                
                <div>
                    <label class="ksp-label">Author</label>
                    <input type="text" name="author" class="ksp-input" placeholder="Optional">
                </div>
                <div>
                    <label class="ksp-label">Genre</label>
                    <input type="text" name="genre" class="ksp-input" placeholder="e.g. Academic" required>
                </div>
                <div>
                    <label class="ksp-label">Image Link</label>
                    <input type="url" name="image_url" class="ksp-input" placeholder="https://...">
                </div>

                
                <div class="ksp-form-2col">
                    <div>
                        <label class="ksp-label" style="color:#E0B36A;">Min Acceptable (&#8377;)</label>
                        <input type="number" name="min_price" class="ksp-input" min="0" step="1" required>
                    </div>
                    <div>
                        <label class="ksp-label" style="color:#E0B36A;">Max Price (&#8377;)</label>
                        <input type="number" name="max_price" class="ksp-input" min="0" step="1" required>
                    </div>
                </div>
                <div>
                    <label class="ksp-label">Lend Duration (Days)</label>
                    <input type="number" name="lend_dur_days" class="ksp-input" placeholder="Leave blank if Sale">
                </div>

                
                <div class="ksp-form-full">
                    <label class="ksp-label">Description & Condition</label>
                    <textarea name="description" class="ksp-input" placeholder="Mention condition, marks, edition..."></textarea>
                </div>

            </div>

            <div class="ksp-form-footer">
                <a href="Seller_Dashboard.jsp" class="ksp-btn ksp-btn-ghost">Cancel</a>
                <button type="submit" class="ksp-btn">Publish Listing</button>
            </div>
        </form>

    </main>
</div>

</body>
</html>