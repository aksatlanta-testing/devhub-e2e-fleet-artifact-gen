
{{- define "go-echo19f9119f-b40e-437d-81e0-76dce8fb5a11.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo19f9119f-b40e-437d-81e0-76dce8fb5a11.fullname" -}}
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


{{- define "go-echo19f9119f-b40e-437d-81e0-76dce8fb5a11.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo19f9119f-b40e-437d-81e0-76dce8fb5a11.labels" -}}
helm.sh/chart: {{ include "go-echo19f9119f-b40e-437d-81e0-76dce8fb5a11.chart" . }}
{{ include "go-echo19f9119f-b40e-437d-81e0-76dce8fb5a11.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo19f9119f-b40e-437d-81e0-76dce8fb5a11.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo19f9119f-b40e-437d-81e0-76dce8fb5a11.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}