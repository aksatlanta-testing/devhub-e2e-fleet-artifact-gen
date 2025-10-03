
{{- define "go-echofc815a4a-553f-440e-9e09-c5e4db0fdc18.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc815a4a-553f-440e-9e09-c5e4db0fdc18.fullname" -}}
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


{{- define "go-echofc815a4a-553f-440e-9e09-c5e4db0fdc18.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc815a4a-553f-440e-9e09-c5e4db0fdc18.labels" -}}
helm.sh/chart: {{ include "go-echofc815a4a-553f-440e-9e09-c5e4db0fdc18.chart" . }}
{{ include "go-echofc815a4a-553f-440e-9e09-c5e4db0fdc18.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofc815a4a-553f-440e-9e09-c5e4db0fdc18.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofc815a4a-553f-440e-9e09-c5e4db0fdc18.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}