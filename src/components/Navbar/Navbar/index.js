import React from "react";
import { Bookmark } from "@mui/icons-material";
import "./styles.scss";

export default function Navbar() {
  return (
    <div>
      <nav>
        <div className="container">
          <div>
            <Bookmark />
            <h1>To Do</h1>
          </div>
        </div>
      </nav>
    </div>
  );
}
