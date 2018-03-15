import React from 'react';
import { Provider } from 'react-redux';

import GiphysSearchContainer from './giphys_search_container';

const Root = ({ store }) => {
  return (
    <Provider store={store}>
      <div>
        Hey nowwww

      </div>
    </Provider>
  );
};

export default Root;
