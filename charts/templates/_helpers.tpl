
{{- define "go-echoc7ed70c3-4781-4281-86d3-7208bcd387fd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc7ed70c3-4781-4281-86d3-7208bcd387fd.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoc7ed70c3-4781-4281-86d3-7208bcd387fd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc7ed70c3-4781-4281-86d3-7208bcd387fd.labels" -}}
helm.sh/chart: {{ include "go-echoc7ed70c3-4781-4281-86d3-7208bcd387fd.chart" . }}
{{ include "go-echoc7ed70c3-4781-4281-86d3-7208bcd387fd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc7ed70c3-4781-4281-86d3-7208bcd387fd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc7ed70c3-4781-4281-86d3-7208bcd387fd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}