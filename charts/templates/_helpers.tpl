
{{- define "go-echoab2eec11-8c5e-4a75-a43b-57e411988477.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab2eec11-8c5e-4a75-a43b-57e411988477.fullname" -}}
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


{{- define "go-echoab2eec11-8c5e-4a75-a43b-57e411988477.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab2eec11-8c5e-4a75-a43b-57e411988477.labels" -}}
helm.sh/chart: {{ include "go-echoab2eec11-8c5e-4a75-a43b-57e411988477.chart" . }}
{{ include "go-echoab2eec11-8c5e-4a75-a43b-57e411988477.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoab2eec11-8c5e-4a75-a43b-57e411988477.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoab2eec11-8c5e-4a75-a43b-57e411988477.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}