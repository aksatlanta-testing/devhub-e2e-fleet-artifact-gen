
{{- define "go-echofa9d8ccf-443e-4039-8505-b813cbc3e242.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa9d8ccf-443e-4039-8505-b813cbc3e242.fullname" -}}
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


{{- define "go-echofa9d8ccf-443e-4039-8505-b813cbc3e242.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa9d8ccf-443e-4039-8505-b813cbc3e242.labels" -}}
helm.sh/chart: {{ include "go-echofa9d8ccf-443e-4039-8505-b813cbc3e242.chart" . }}
{{ include "go-echofa9d8ccf-443e-4039-8505-b813cbc3e242.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofa9d8ccf-443e-4039-8505-b813cbc3e242.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofa9d8ccf-443e-4039-8505-b813cbc3e242.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}