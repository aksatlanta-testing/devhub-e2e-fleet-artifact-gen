
{{- define "go-echoe3ed893d-86d1-4b8e-b10c-d4c49195e51d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe3ed893d-86d1-4b8e-b10c-d4c49195e51d.fullname" -}}
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


{{- define "go-echoe3ed893d-86d1-4b8e-b10c-d4c49195e51d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe3ed893d-86d1-4b8e-b10c-d4c49195e51d.labels" -}}
helm.sh/chart: {{ include "go-echoe3ed893d-86d1-4b8e-b10c-d4c49195e51d.chart" . }}
{{ include "go-echoe3ed893d-86d1-4b8e-b10c-d4c49195e51d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe3ed893d-86d1-4b8e-b10c-d4c49195e51d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe3ed893d-86d1-4b8e-b10c-d4c49195e51d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}