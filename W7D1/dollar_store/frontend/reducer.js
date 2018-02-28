

const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state = initialState, action) => {
  Object.freeze(state);
  switch(action.type) {
    case "SWITCH_CURRENCY":
      let nextState = {
        baseCurrency: action.baseCurrency,
        rates: action.rates
      }
      return nextState;
    default:
      return state;
  }
};

export default reducer;
