
{{- define "go-echo1f1969a0-91b3-46b7-bc1c-b9d7f80c3d3e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1f1969a0-91b3-46b7-bc1c-b9d7f80c3d3e.fullname" -}}
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


{{- define "go-echo1f1969a0-91b3-46b7-bc1c-b9d7f80c3d3e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1f1969a0-91b3-46b7-bc1c-b9d7f80c3d3e.labels" -}}
helm.sh/chart: {{ include "go-echo1f1969a0-91b3-46b7-bc1c-b9d7f80c3d3e.chart" . }}
{{ include "go-echo1f1969a0-91b3-46b7-bc1c-b9d7f80c3d3e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1f1969a0-91b3-46b7-bc1c-b9d7f80c3d3e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1f1969a0-91b3-46b7-bc1c-b9d7f80c3d3e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}