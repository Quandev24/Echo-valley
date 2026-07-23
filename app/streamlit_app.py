import streamlit as st

st.set_page_config(
    layout="wide",
    page_title="Olist E-Commerce — Phân tích Logistics & Dự báo giao hàng",
    page_icon="📦"
)

# Custom CSS to remove all Streamlit default margins, headers, sidebars and scrollbars
# Fixed: overflow hidden on root containers to prevent double scrollbar and viewport drag clipping
st.markdown("""
<style>
    /* Hide Streamlit top header bar */
    [data-testid="stHeader"] {
        display: none !important;
        visibility: hidden !important;
    }
    /* Hide default sidebar if somehow active */
    [data-testid="stSidebar"] {
        display: none !important;
        visibility: hidden !important;
    }
    /* Set block container padding and margin to zero */
    .block-container {
        padding: 0px !important;
        margin: 0px !important;
        max-width: 100% !important;
    }
    /* Force main app view to be borderless and marginless */
    [data-testid="stAppViewContainer"] {
        padding: 0px !important;
        margin: 0px !important;
        overflow: hidden !important;
    }
    /* Hide Streamlit root scrollbars completely to prevent drag black areas */
    html, body, [data-testid="stAppViewContainer"], .main {
        overflow: hidden !important;
        height: 100vh !important;
        background-color: #f8f9fa !important;
    }
    /* Set interactive frame to cover the entire viewport fixed */
    iframe {
        width: 100vw !important;
        height: 100vh !important;
        border: none !important;
        margin: 0px !important;
        padding: 0px !important;
        position: fixed !important;
        top: 0 !important;
        left: 0 !important;
        z-index: 999999 !important;
    }
</style>
""", unsafe_allow_html=True)

# Load index.html content and output it full-screen
try:
    with open("app/index.html", "r", encoding="utf-8") as f:
        html_code = f.read()
    st.components.v1.html(html_code, height=4200, scrolling=True)
except Exception as e:
    st.error(f"Lỗi khi tải giao diện: {e}")
