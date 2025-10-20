
{{- define "go-echoa14053bb-0c55-4c13-96f6-2100937bcf65.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa14053bb-0c55-4c13-96f6-2100937bcf65.fullname" -}}
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


{{- define "go-echoa14053bb-0c55-4c13-96f6-2100937bcf65.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa14053bb-0c55-4c13-96f6-2100937bcf65.labels" -}}
helm.sh/chart: {{ include "go-echoa14053bb-0c55-4c13-96f6-2100937bcf65.chart" . }}
{{ include "go-echoa14053bb-0c55-4c13-96f6-2100937bcf65.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa14053bb-0c55-4c13-96f6-2100937bcf65.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa14053bb-0c55-4c13-96f6-2100937bcf65.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}