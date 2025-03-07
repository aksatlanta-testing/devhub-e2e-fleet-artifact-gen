
{{- define "go-echoe597a57c-cca7-4773-8f95-5bbf335a64ba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe597a57c-cca7-4773-8f95-5bbf335a64ba.fullname" -}}
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


{{- define "go-echoe597a57c-cca7-4773-8f95-5bbf335a64ba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe597a57c-cca7-4773-8f95-5bbf335a64ba.labels" -}}
helm.sh/chart: {{ include "go-echoe597a57c-cca7-4773-8f95-5bbf335a64ba.chart" . }}
{{ include "go-echoe597a57c-cca7-4773-8f95-5bbf335a64ba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe597a57c-cca7-4773-8f95-5bbf335a64ba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe597a57c-cca7-4773-8f95-5bbf335a64ba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}