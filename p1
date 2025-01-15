import React, { useState } from 'react';
const WebCounter = () => {
  const percentages = [87, 92, 58, 65, 75, 88, 90, 55, 82, 61, 85, 95, 79, 63, 67, 84, 60, 88, 77, 83, 68, 70, 59, 72, 64, 81, 89, 90, 66, 80];
  const distinctionCount = percentages.filter((percent) => percent >= 85).length;
  const firstClassCount = percentages.filter((percent) => percent >= 60 && percent < 85).length;
  return (
    <div style={{ textAlign: "center", marginTop: "50px" }}>
      <h1>Web Counter Application</h1>
      <p>Total Students: {percentages.length}</p>
      <p>Distinction (85% and above): {distinctionCount}</p>
      <p>First Class (60% to 84%): {firstClassCount}</p>
    </div>
  );
};
export default WebCounter;
