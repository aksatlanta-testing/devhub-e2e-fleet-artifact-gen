
{{- define "go-echod7f7e089-86aa-4dc2-9dd1-0f13732c2065.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7f7e089-86aa-4dc2-9dd1-0f13732c2065.fullname" -}}
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


{{- define "go-echod7f7e089-86aa-4dc2-9dd1-0f13732c2065.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7f7e089-86aa-4dc2-9dd1-0f13732c2065.labels" -}}
helm.sh/chart: {{ include "go-echod7f7e089-86aa-4dc2-9dd1-0f13732c2065.chart" . }}
{{ include "go-echod7f7e089-86aa-4dc2-9dd1-0f13732c2065.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod7f7e089-86aa-4dc2-9dd1-0f13732c2065.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod7f7e089-86aa-4dc2-9dd1-0f13732c2065.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}