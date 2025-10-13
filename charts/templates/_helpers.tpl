
{{- define "go-echodde11874-18f8-4037-bc28-1b54657c9228.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodde11874-18f8-4037-bc28-1b54657c9228.fullname" -}}
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


{{- define "go-echodde11874-18f8-4037-bc28-1b54657c9228.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodde11874-18f8-4037-bc28-1b54657c9228.labels" -}}
helm.sh/chart: {{ include "go-echodde11874-18f8-4037-bc28-1b54657c9228.chart" . }}
{{ include "go-echodde11874-18f8-4037-bc28-1b54657c9228.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodde11874-18f8-4037-bc28-1b54657c9228.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodde11874-18f8-4037-bc28-1b54657c9228.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}