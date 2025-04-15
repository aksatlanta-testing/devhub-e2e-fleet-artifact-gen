
{{- define "go-echoae182c43-c8fd-4602-92fc-c6cfe4c3a472.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae182c43-c8fd-4602-92fc-c6cfe4c3a472.fullname" -}}
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


{{- define "go-echoae182c43-c8fd-4602-92fc-c6cfe4c3a472.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae182c43-c8fd-4602-92fc-c6cfe4c3a472.labels" -}}
helm.sh/chart: {{ include "go-echoae182c43-c8fd-4602-92fc-c6cfe4c3a472.chart" . }}
{{ include "go-echoae182c43-c8fd-4602-92fc-c6cfe4c3a472.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae182c43-c8fd-4602-92fc-c6cfe4c3a472.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae182c43-c8fd-4602-92fc-c6cfe4c3a472.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}