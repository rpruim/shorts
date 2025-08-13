return {
  ['vfill'] = function(args, kwargs, meta) 
    local raw = {
    html = '<br/><br/><br/>',
    latex = '\\vfill{}',
    typst = '#v(1fr)',
  }

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

  ['br'] = function(args, kwargs, meta) 
    local raw = {
    html = '<br/><br/>',
    latex = '\\bigksip{}',
    typst = '#v(1em)',
  }

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
}
