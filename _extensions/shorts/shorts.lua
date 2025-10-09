local function raw2pandoc(raw)

  if quarto.doc.isFormat('pdf') then
    return pandoc.RawBlock('tex', raw.latex)
  elseif quarto.doc.isFormat('html') then
    return pandoc.RawBlock('html', raw.html)
  elseif quarto.doc.isFormat('typst') then
    return pandoc.RawBlock('typst', raw.typst)
  else
    -- fall back 
    return pandoc.Para{pandoc.Str ''}
    end
end

return {
  ['vfill'] = function(args, kwargs, meta)
    local raw = {
      html = '<br/><br/><br/>',
      latex = '\\vfill{}',
      typst = '#v(1fr)',
    }
    return raw2pandoc(raw)
  end,

  ['medskip'] = function(args, kwargs, meta)
    local raw = {
      html = '<br/><br/>',
      latex = '\\medksip{}',
      typst = '#v(1em)',
    }
    return raw2pandoc(raw)
  end,

  ['bigskip'] = function(args, kwargs, meta)
    local raw = {
      html = '<br/><br/><br/>',
      latex = '\\bigskip{}',
      typst = '#v(2em)',
    }
    return raw2pandoc(raw)
  end,


  ['nmedskip'] = function(args, kwargs, meta)
    local raw = {
      html = '',
      latex = '\\vspace{-1em}',
      typst = '#v(-1em)',
    }
    return raw2pandoc(raw)
  end,

  ['vspace'] = function(args, kwargs, meta)
    local raw = {
      html = '',
      latex = '\\vspace{args[0]}',
      typst = '#v(args[0])',
    }
    return raw2pandoc(raw)
  end,

  ['nbigskip'] = function(args, kwargs, meta)
    local raw = {
      html = '',
      latex = '\\vspace{-2em}',
      typst = '#v(-2em)',
    }
    return raw2pandoc(raw)
  end
}
