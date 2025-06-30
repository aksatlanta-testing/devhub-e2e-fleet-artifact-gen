
{{- define "go-echo13178d44-db3e-403e-9003-0ca9c44908db.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo13178d44-db3e-403e-9003-0ca9c44908db.fullname" -}}
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


{{- define "go-echo13178d44-db3e-403e-9003-0ca9c44908db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo13178d44-db3e-403e-9003-0ca9c44908db.labels" -}}
helm.sh/chart: {{ include "go-echo13178d44-db3e-403e-9003-0ca9c44908db.chart" . }}
{{ include "go-echo13178d44-db3e-403e-9003-0ca9c44908db.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo13178d44-db3e-403e-9003-0ca9c44908db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo13178d44-db3e-403e-9003-0ca9c44908db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}