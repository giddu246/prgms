import React, { useState, useEffect } from 'react';
const InputValidation = () => {
  const [input, setInput] = useState("");
  const [isValid, setIsValid] = useState(false);
  useEffect(() => {
    setIsValid(input.length > 5);
  }, [input]);
  const handleChange = (event) => {
    setInput(event.target.value);
  };
  return (
    <div style={{ textAlign: "center", marginTop: "50px" }}>
      <h1>Input Validation Example</h1>
      <input
        type="text"
        value={input}
        onChange={handleChange}
        placeholder="Enter text..."
      />
      <p>{isValid ? "Valid Input" : "Input must be at least 6 characters"}</p>
    </div>
  );
};
export default InputValidation;
