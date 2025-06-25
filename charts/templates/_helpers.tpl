
{{- define "go-echo8d32505e-a2d6-4048-97bd-d6b06a05e7da.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8d32505e-a2d6-4048-97bd-d6b06a05e7da.fullname" -}}
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


{{- define "go-echo8d32505e-a2d6-4048-97bd-d6b06a05e7da.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8d32505e-a2d6-4048-97bd-d6b06a05e7da.labels" -}}
helm.sh/chart: {{ include "go-echo8d32505e-a2d6-4048-97bd-d6b06a05e7da.chart" . }}
{{ include "go-echo8d32505e-a2d6-4048-97bd-d6b06a05e7da.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8d32505e-a2d6-4048-97bd-d6b06a05e7da.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8d32505e-a2d6-4048-97bd-d6b06a05e7da.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}