
{{- define "go-echofa71758c-e03e-4650-9dd9-cb8c5e153608.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa71758c-e03e-4650-9dd9-cb8c5e153608.fullname" -}}
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


{{- define "go-echofa71758c-e03e-4650-9dd9-cb8c5e153608.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa71758c-e03e-4650-9dd9-cb8c5e153608.labels" -}}
helm.sh/chart: {{ include "go-echofa71758c-e03e-4650-9dd9-cb8c5e153608.chart" . }}
{{ include "go-echofa71758c-e03e-4650-9dd9-cb8c5e153608.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofa71758c-e03e-4650-9dd9-cb8c5e153608.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofa71758c-e03e-4650-9dd9-cb8c5e153608.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}