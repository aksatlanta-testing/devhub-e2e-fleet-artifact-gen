
{{- define "go-echoce4028c8-a4c8-4b7c-b209-5313e0c7bc84.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce4028c8-a4c8-4b7c-b209-5313e0c7bc84.fullname" -}}
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


{{- define "go-echoce4028c8-a4c8-4b7c-b209-5313e0c7bc84.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce4028c8-a4c8-4b7c-b209-5313e0c7bc84.labels" -}}
helm.sh/chart: {{ include "go-echoce4028c8-a4c8-4b7c-b209-5313e0c7bc84.chart" . }}
{{ include "go-echoce4028c8-a4c8-4b7c-b209-5313e0c7bc84.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoce4028c8-a4c8-4b7c-b209-5313e0c7bc84.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoce4028c8-a4c8-4b7c-b209-5313e0c7bc84.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}